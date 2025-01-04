// filepath: /Users/eitanxaop/dev/private-projects/something-with-wool/sww-frontend/src/redux/authUser/authUser.thunks.ts
import { SessionApi } from '../../../api/endpoints/sessions/session.api.service';
import {
  LoginCredentials,
  LoginResponse,
} from '../../../api/endpoints/sessions/session.api.types';
import { createThunk } from '../../utils/createThunk';

export class AuthUserThunks {
  private static apiService = new SessionApi();

  static login = createThunk<LoginCredentials, LoginResponse, SessionApi>({
    apiService: this.apiService,
    actionName: 'user/login',
    apiMethod: 'login',
    onError: (error) => {
      return error;
    },
  });
}
