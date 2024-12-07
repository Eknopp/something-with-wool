import React from 'react';
import { useAuth } from '../../hooks/useAuth';
import Login from '../../pages/login/Login';

interface Props<P extends object> {
  component: React.ComponentType<P>; // Component accepts props of type P
  componentProps?: P; //Optional: Pass props for the component
}

const ProtectedRoutes = <P extends object>({
  component: Component,
  componentProps,
}: Props<P>) => {
  const isAuthenticated = useAuth().isAuthenticated;
  console.log('isAuthenticated: ', isAuthenticated);

  if (!isAuthenticated) {
    return <Login />;
  }

  return <Component {...(componentProps || ({} as P))} />;
};

export default ProtectedRoutes;
