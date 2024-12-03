import { createBrowserRouter } from 'react-router-dom';
import Home from './pages/home/Home';
import LogIn from './pages/logIn/LogIn';
import App from './App';

export const router = createBrowserRouter([
  {
    path: '/',
    element: <App />,
  },
  {
    path: '/home',
    element: <Home />,
  },
  { path: '/login', element: <LogIn /> },
]);
