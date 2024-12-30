import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { LoginResponse } from '../../../api/endpoints/sessions/session.api.types';
import { AuthUserThunks } from '../authUser/authUser.thunks';

export interface InitialStateType {
  // TODO: Add state - loading: 'idle' | 'pending' | 'succeeded' | 'failed'
  username: string | null;
  email: string | null;
  id: number | null;
}
const initialState: InitialStateType = {
  username: null,
  email: null,
  id: null,
};

const authUser = createSlice({
  name: 'user',
  initialState,
  reducers: {
    setAuthUser(
      state: InitialStateType,
      action: PayloadAction<InitialStateType>
    ) {
      state.username = action.payload.username;
      state.email = action.payload.email;
      state.id = action.payload.id;
    },
    removeAuthUser(state) {
      state.username = null;
      state.email = null;
      state.id = null;
    },
  },
  extraReducers: (builder) => {
    // TODO: Add pending and rejected reducers
    builder.addCase(
      AuthUserThunks.login.fulfilled,
      (state, action: PayloadAction<LoginResponse>) => {
        state.username = action.payload.username;
        state.email = action.payload.email;
        state.id = action.payload.id;
      }
    );
  },
});

export const { setAuthUser, removeAuthUser } = authUser.actions;

export default authUser.reducer;
