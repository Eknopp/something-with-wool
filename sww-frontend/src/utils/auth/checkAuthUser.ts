import {
  FoundUser,
  SessionStatus,
} from '../../redux/components/authUser/authUser.redux.types';
import { setAuthUser } from '../../redux/components/authUser/authUser.slice';
import { store } from '../../redux/store';

const checkAuthUser = () => {
  const loggedInUser = localStorage.getItem('user');
  if (loggedInUser) {
    const foundUser: FoundUser = JSON.parse(loggedInUser);
    store.dispatch(
      setAuthUser({
        data: {
          id: foundUser.id,
          email: foundUser.email,
          username: foundUser.username,
        },
        status: SessionStatus.succeeded,
        error: {},
      })
    );
  }
};

export default checkAuthUser;
