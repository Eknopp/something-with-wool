export class UnauthorizedError extends Error {
  constructor(message: string) {
    super(message);
  }
  public override readonly name = 'UnauthorizedError';
  public readonly code = '401';

  toJSON() {
    return {
      name: this.name,
      message: this.message,
      code: this.code,
    };
  }
}
