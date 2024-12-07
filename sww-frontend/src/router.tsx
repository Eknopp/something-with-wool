import { createBrowserRouter } from 'react-router-dom';
import AppLayout from './components/layout/AppLayout';
import Home from './pages/home/Home';
import ProtectedRoutes from './utils/auth/ProtectedRoutes';

export const router = createBrowserRouter([
  {
    path: '/',
    element: <AppLayout />,
    children: [
      {
        index: true,
        element: <ProtectedRoutes component={Home} />,
      },
    ],
  },
]);
