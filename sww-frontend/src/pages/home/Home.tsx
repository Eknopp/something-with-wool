import { Link } from 'react-router-dom';

const Home = () => {
  return (
    <div>
      <div>
        <h1>Home Page</h1>
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
    </div>
  );
};

export default Home;
