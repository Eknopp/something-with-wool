import { createBrowserRouter, Outlet } from 'react-router-dom';
import Home from './pages/home/Home';
import ProtectedRoutes from './utils/ProtectedRoutes';

export const router = createBrowserRouter([
  {
    path: '/',
    element: <LayoutComponent />,
    children: [
      {
        index: true,
        element: <ProtectedRoutes component={Home} />,
      },
    ],
  },
]);

// TODO: refactor;
// For layer etc (header, footer)
// https://www.dhiwise.com/post/the-power-of-createbrowserrouter-optimizing-your-react-app
function LayoutComponent() {
  return (
    <div>
      <header>Header Content</header>
      <main>
        <Outlet /> {/* Nested routes render here */}
      </main>
      <footer>Footer Content</footer>
    </div>
  );
}
