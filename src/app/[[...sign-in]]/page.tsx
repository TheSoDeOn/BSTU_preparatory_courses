"use client";

import * as Clerk from "@clerk/elements/common";
import * as SignIn from "@clerk/elements/sign-in";
import { useUser } from "@clerk/nextjs";
import Image from "next/image";
import { useRouter } from "next/navigation";
import { useEffect } from "react";

const LoginPage = () => {
  const { isLoaded, isSignedIn, user } = useUser();

  const router = useRouter();

  useEffect(() => {
    const role = user?.publicMetadata.role;

    if (role) {
      router.push(`/${role}`);
    }
  }, [user, router]);

  return (
    <div className="h-screen flex items-center justify-center">
      <Image
        alt=""
        src="/cover.png"
        fill={true}
        className="bgWrap"
        quality={100}
      />
      <SignIn.Root>
        <SignIn.Step
          name="start"
          className="bg-white p-12 rounded-md shadow-2xl flex flex-col gap-2"
        >
          <h1 className="text-xl text-blueBSTU font-bold flex items-center gap-2">
            <Image src="/logo.png" alt="" width={64} height={64} />
            Подготовительные курсы БГТУ им. В. Г. Шухова
          </h1>
          <h2 className="text-gray-400">Войдите в свой аккаунт</h2>

          <Clerk.GlobalError className="text-sm text-red-400" />
          <Clerk.Field name="identifier" className="flex flex-col gap-2">
            <Clerk.Label className="text-gray-500 text-xs">
              Имя пользователя
            </Clerk.Label>
            <Clerk.Input
              className="p-2 rounded-md ring-2 ring-skyBlueBSTU"
              type="text"
              required
            />
            <Clerk.FieldError className="text-sm text-red-400" />
          </Clerk.Field>
          <Clerk.Field name="password" className="flex flex-col gap-2">
            <Clerk.Label className="text-gray-500 text-xs">Пароль</Clerk.Label>
            <Clerk.Input
              className="p-2 rounded-md ring-2 ring-skyBlueBSTU"
              type="password"
              required
            />
            <Clerk.FieldError className="text-sm text-red-400" />
          </Clerk.Field>
          <SignIn.Action
            submit
            className="bg-skyBlueBSTU text-white my-1 rounded-md p-[10px]"
          >
            Войти
          </SignIn.Action>
        </SignIn.Step>
      </SignIn.Root>
    </div>
  );
};

export default LoginPage;
