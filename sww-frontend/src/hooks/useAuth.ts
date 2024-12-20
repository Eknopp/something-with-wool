import { useAppSelector } from './redux-hooks';

export function useAuth() {
  const { username, email, token, id } = useAppSelector(
    (state) => state.authUser
  );
  return { username, email, id, token, isAuthenticated: !!token };
}
