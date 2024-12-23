import { createSlice, PayloadAction } from '@reduxjs/toolkit';

export interface InitialStateType {
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
});

export const { setAuthUser, removeAuthUser } = authUser.actions;

export default authUser.reducer;
