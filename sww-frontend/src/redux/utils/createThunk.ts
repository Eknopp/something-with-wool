import { createAsyncThunk, SerializedError } from '@reduxjs/toolkit';
import { UnauthorizedError } from '../../api/services/api.service.errors';
import { SerializeErrorForThunk } from './serializeErrorForThunk';

type ThunkParams<TApiService, TResponse> = {
  apiService: TApiService;
  actionName: string;
  apiMethod: keyof TApiService;
  onSuccess?: (response: TResponse) => void;
  onError?: (error: SerializedError) => void;
};

export function createThunk<TRequest, TResponse, TApiService>({
  apiService,
  actionName,
  apiMethod,
  onSuccess,
  onError,
}: ThunkParams<TApiService, TResponse>) {
  return createAsyncThunk<TResponse, TRequest>(
    actionName,
    async (params, { rejectWithValue }) => {
      try {
        const response: TResponse = await (
          apiService[apiMethod] as (params: TRequest) => Promise<TResponse>
        )(params);
        if (onSuccess) {
          onSuccess(response);
        }
        return response;
      } catch (error) {
        if (
          (onError && error instanceof UnauthorizedError) ||
          (onError && error instanceof Error)
        ) {
          return rejectWithValue(
            onError(
              SerializeErrorForThunk(
                error,
                error instanceof UnauthorizedError ? error.code : undefined
              )
            )
          );
        }
        return rejectWithValue(error);
      }
    }
  );
}
