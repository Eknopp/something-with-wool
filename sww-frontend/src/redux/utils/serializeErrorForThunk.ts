import { SerializedError } from '@reduxjs/toolkit';

export function SerializeErrorForThunk(error: Error, code?: string) {
  const serializedError: SerializedError = {
    name: error.name,
    message: error.message,
    code: code,
  };
  return serializedError;
}
