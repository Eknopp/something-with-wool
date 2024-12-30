import { createAsyncThunk } from '@reduxjs/toolkit';

type ThunkParams<TApiService, TResponse> = {
  apiService: TApiService;
  actionName: string;
  apiMethod: keyof TApiService;
  onSuccess?: (response: TResponse) => void;
  onError?: (error: unknown) => void;
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
        if (onError) {
          onError(error);
        }
        return rejectWithValue(error);
      }
    }
  );
}
