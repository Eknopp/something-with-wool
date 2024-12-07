import { createBrowserRouter } from 'react-router-dom';
import App from './App';
import Home from './pages/home/Home';
import LogIn from './pages/logIn/LogIn';
import ProtectedRoutes from './utils/ProtectedRoutes';

export const router = createBrowserRouter([
  {
    path: '/',
    element: <App />,
  },
  {
    path: '/home',
    element: <ProtectedRoutes component={Home} />,
  },
  { path: '/login', element: <LogIn /> },
]);
