import { UnauthorizedError } from '../../services/api.service.errors';

export type LoginCredentials = {
  email: string;
  password: string;
};

export type LoginResponse =
  | {
      id: number;
      email: string;
      username: string;
    }
  | UnauthorizedError;
