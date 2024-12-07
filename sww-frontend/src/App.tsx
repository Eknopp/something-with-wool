import { useEffect } from 'react';
import { RouterProvider } from 'react-router-dom';
import { useAuth } from './hooks/useAuth';
import { router } from './router';
import checkAuthUser from './utils/auth/checkAuthUser';

function App() {
  const { isAuthenticated } = useAuth();

  useEffect(() => {
    checkAuthUser();
  }, [isAuthenticated]);

  return (
    <div>
      <RouterProvider router={router} />
    </div>
  );
}

export default App;
