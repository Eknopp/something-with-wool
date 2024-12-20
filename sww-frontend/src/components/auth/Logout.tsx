import { useDispatch } from 'react-redux';
import { useAuth } from '../../hooks/useAuth';
import { removeAuthUser } from '../../redux/authUser/authUser.slice';

const Logout = () => {
  const dispatch = useDispatch();
  const { email, token } = useAuth();

  const handleLogout = async () => {
    try {
      const response = await fetch(' http://localhost:3001/logout', {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({ user: { email: email } }),
      });
      if (!response.ok) {
        throw new Error('Logout failed');
      } else {
        dispatch(removeAuthUser());
        localStorage.clear();
      }
    } catch (error) {
      console.log('Failed to logout: ', error);
    }
  };

  return <button onClick={handleLogout}>Logout</button>;
};

export default Logout;
