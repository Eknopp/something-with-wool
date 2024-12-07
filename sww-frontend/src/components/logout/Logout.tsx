import { useDispatch } from 'react-redux';
import { removeAuthUser } from '../../redux/authUser/authUser.slice';

const Logout = () => {
  const dispatch = useDispatch();

  const handleLogout = () => {
    dispatch(removeAuthUser());
    localStorage.clear();
  };

  return <button onClick={handleLogout}>Logout</button>;
};

export default Logout;
