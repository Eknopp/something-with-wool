import { createSlice, PayloadAction, SerializedError } from '@reduxjs/toolkit';
import { LoginResponse } from '../../../api/endpoints/sessions/session.api.types';
import { AuthUserThunks } from '../authUser/authUser.thunks';
import {
  InitialAuthUserStateType,
  SessionStatus,
} from './authUser.redux.types';

const initialState: InitialAuthUserStateType = {
  data: {
    username: null,
    email: null,
    id: null,
  },
  status: SessionStatus.idle,
  error: {},
};

const authUser = createSlice({
  name: 'user',
  initialState,
  reducers: {
    setAuthUser(
      state: InitialAuthUserStateType,
      action: PayloadAction<InitialAuthUserStateType>
    ) {
      state.data = {
        username: action.payload.data.username,
        email: action.payload.data.email,
        id: action.payload.data.id,
      };
      state.status = action.payload.status;
      state.error = {};
    },
    removeAuthUser(state: InitialAuthUserStateType) {
      state.data = {
        username: null,
        email: null,
        id: null,
      };
      state.status = SessionStatus.idle;
      state.error = {};
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(AuthUserThunks.login.pending, (state) => {
        state.status = SessionStatus.pending;
      })
      .addCase(
        AuthUserThunks.login.fulfilled,
        (state, action: PayloadAction<LoginResponse>) => {
          if ('id' in action.payload) {
            state.data = {
              username: action.payload.username,
              email: action.payload.email,
              id: action.payload.id,
            };
          }
          state.status = SessionStatus.succeeded;
          state.error = {};
        }
      )
      .addCase(AuthUserThunks.login.rejected, (state, action) => {
        state.status = SessionStatus.failed;
        state.error = action.payload as SerializedError;
      });
  },
});

export const { setAuthUser, removeAuthUser } = authUser.actions;

export default authUser.reducer;
