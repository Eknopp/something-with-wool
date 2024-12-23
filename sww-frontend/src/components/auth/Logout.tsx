import { useDispatch } from 'react-redux';
import { useAuth } from '../../hooks/useAuth';
import { removeAuthUser } from '../../redux/authUser/authUser.slice';

const Logout = () => {
  const dispatch = useDispatch();
  const { email } = useAuth();

  const handleLogout = async () => {
    try {
      await fetch('http://localhost:3001/logout', {
        method: 'DELETE',
        credentials: 'include',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ user: { email: email } }),
      });
      dispatch(removeAuthUser());
      localStorage.clear();
    } catch (error) {
      console.log('Failed to logout: ', error);
    }
  };

  return <button onClick={handleLogout}>Logout</button>;
};

export default Logout;
