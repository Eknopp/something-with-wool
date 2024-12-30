import { setAuthUser } from '../../redux/components/authUser/authUser.slice';
import { store } from '../../redux/store';
import { FoundUser } from './checkAuthUser.types';

const checkAuthUser = () => {
  const loggedInUser = localStorage.getItem('user');
  if (loggedInUser) {
    const foundUser: FoundUser = JSON.parse(loggedInUser);
    store.dispatch(
      setAuthUser({
        id: foundUser.id,
        email: foundUser.email,
        username: foundUser.username,
      })
    );
  }
};

export default checkAuthUser;
