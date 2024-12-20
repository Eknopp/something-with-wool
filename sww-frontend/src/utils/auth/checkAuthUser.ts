import { setAuthUser } from '../../redux/authUser/authUser.slice';
import { store } from '../../redux/store';

type FoundUser = {
  data: {
    email: string;
    id: number;
    username: string;
  };
};

const checkAuthUser = () => {
  const loggedInUser = localStorage.getItem('user');
  const token = localStorage.getItem('token');
  if (loggedInUser) {
    const foundUser: FoundUser = JSON.parse(loggedInUser);
    store.dispatch(
      setAuthUser({
        id: foundUser.data.id,
        email: foundUser.data.email,
        username: foundUser.data.username,
        token: token,
      })
    );
  }
};

export default checkAuthUser;
