import { useAuth } from './hooks/use-auth';
import Home from './pages/home/Home';
import LogIn from './pages/logIn/LogIn';

function App() {
  const { isAuthenticated } = useAuth();
  return <div>{isAuthenticated ? <Home /> : <LogIn />}</div>;
}

export default App;
