import { ApiService } from '../../services/api.service.abstract';
import { UnauthorizedError } from '../../services/api.service.errors';
import { LoginCredentials, LoginResponse } from './session.api.types';

export class SessionApi extends ApiService {
  async login(loginCredentials: LoginCredentials): Promise<LoginResponse> {
    try {
      const { data: responseData }: { data: LoginResponse } = await this.fetch(
        'login',
        'POST',
        {
          body: { user: loginCredentials },
        }
      );
      return responseData;
    } catch (error) {
      if (error instanceof UnauthorizedError) {
        throw error;
      }
      throw new Error(`${error}`);
    }
  }
}
