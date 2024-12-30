import { UnauthorizedError } from './api.service.errors';

export abstract class ApiService {
  private readonly apiEndpoint = new URL(import.meta.env.VITE_API_URL);

  protected async fetch<T>(
    path: string,
    method: 'GET' | 'POST' | 'PUT' | 'PATCH' | 'DELETE' = 'GET',
    {
      body,
      params = {},
      headers = {},
    }: {
      params?: Record<string, string> | undefined;
      body?: unknown;
      headers?: Record<string, string> | undefined;
    } = {}
  ): Promise<T> {
    const url = new URL(path, this.apiEndpoint);

    for (const [key, value] of Object.entries(params)) {
      url.searchParams.set(key, value);
    }

    const result = await fetch(url, {
      method,
      body: body ? JSON.stringify(body) : null,
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        ...headers,
      },
      credentials: 'include',
    });

    if (result.statusText === 'Unauthorized') {
      throw new UnauthorizedError();
    } else if (!result.ok) {
      throw new Error(`Failed to fetch ${path}: ${result.statusText}`);
    }

    return await result.json();
  }
}
