import { useAppSelector } from './redux-hooks';

export function useAuth() {
  const { username, email, id } = useAppSelector((state) => state.authUser);
  return { username, email, id, isAuthenticated: !!email };
}
