import { Outlet } from 'react-router-dom';
import AppFooter from './AppFooter';
import AppHeader from './AppHeader';

const AppLayout = () => {
  return (
    <div>
      <header>
        <AppHeader />
      </header>
      <main>
        <Outlet /> {/* Nested routes render here */}
      </main>
      <footer>
        <AppFooter />
      </footer>
    </div>
  );
};

export default AppLayout;
