import { Link } from 'react-router-dom';
import Logout from '../../components/auth/Logout';
import { useAuth } from '../../hooks/useAuth';

const Home = () => {
  const { username } = useAuth();
  // useEffect(() => {}, [username]);
  return (
    <div>
      <div>
        <h1>Home Page</h1>
        <p>Hello {username}</p>
        <p>Welcome to Something With Wool!</p>
      </div>
      <div>
        <p>
          <Link className="text-blue-500 hover:text-blue-700" to="/">
            Home
          </Link>
        </p>
        <p>
          <Link className="text-blue-500 hover:text-blue-700" to="/login">
            Log In
          </Link>
        </p>
      </div>
      <div>
        <p>
          Logout: <Logout />
        </p>
      </div>
    </div>
  );
};

export default Home;
