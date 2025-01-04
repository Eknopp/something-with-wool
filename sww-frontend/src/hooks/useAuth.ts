import { useAppSelector } from './redux-hooks';

export function useAuth() {
  const {
    user: {
      data: { username, email, id },
      status,
      error,
    },
  } = useAppSelector((state) => state.persistedReducer);
  return { username, email, id, isAuthenticated: !!id, status, error };
}
