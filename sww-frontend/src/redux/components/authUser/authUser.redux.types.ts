export type FoundUser = {
  email: string;
  id: number;
  username: string;
};

export interface InitialUserData {
  username: string | null;
  email: string | null;
  id: number | null;
}

export enum sessionStatus {
  idle = 'idle',
  pending = 'pending',
  succeeded = 'succeeded',
  failed = 'failed',
}

export interface InitialAuthUserStateType {
  data: InitialUserData;
  status: sessionStatus;
  error: unknown;
}
