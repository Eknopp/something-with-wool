import { useEffect } from 'react';
import { useAppDispatch } from './hooks/redux-hooks';
import { useAuth } from './hooks/use-auth';
import { setAuthUser } from './redux/authUser/authUser.slice';
import { RouterProvider } from 'react-router-dom';
import { router } from './router';

function App() {
  const dispatch = useAppDispatch();
  const { isAuthenticated } = useAuth();

  useEffect(() => {
    const loggedInUser = localStorage.getItem('user');
    if (loggedInUser) {
      const foundUser = JSON.parse(loggedInUser);
      // TODO: refactor this to a separate file
      dispatch(
        setAuthUser({
          id: foundUser.id.toString(),
          email: foundUser.email_address,
          username: foundUser.username,
          token: foundUser.token,
        })
      );
    }
  }, [isAuthenticated, dispatch]);

  return (
    <div>
      <RouterProvider router={router} />
    </div>
  );
}

export default App;
