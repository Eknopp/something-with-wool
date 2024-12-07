import { setAuthUser } from '../../redux/authUser/authUser.slice';
import { store } from '../../redux/store';

const checkAuthUser = () => {
  const loggedInUser = localStorage.getItem('user');
  if (loggedInUser) {
    const foundUser = JSON.parse(loggedInUser);
    store.dispatch(
      setAuthUser({
        id: foundUser.id.toString(),
        email: foundUser.email_address,
        username: foundUser.username,
        token: foundUser.token,
      })
    );
  }
};

export default checkAuthUser;
