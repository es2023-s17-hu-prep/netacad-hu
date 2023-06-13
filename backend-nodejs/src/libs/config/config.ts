import { get } from 'env-var';

export class Config {
  server = {
    host: get('SERVER_HOST').default('0.0.0.0').asString(),
    port: get('SERVER_PORT').default('5000').asString(),
  };
}
