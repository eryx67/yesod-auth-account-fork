{- Copyright (c) 2014 John Lenz

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-}
{-# LANGUAGE OverloadedStrings #-}
module Yesod.Auth.Account.Message(
    AccountMsg(..)
  , defaultAccountMsg
  , englishAccountMsg
  , russianAccountMsg
) where

import qualified Data.Text as T

-- | Messages specific to yesod-auth-account-fork.  We also use messages from "Yesod.Auth.Message".
data AccountMsg = MsgUsername
                | MsgLoginName
                | MsgForgotPassword
                | MsgInvalidUsername
                | MsgInvalidPassword
                | MsgInvalidEmail'
                | MsgUsernameExists T.Text
                | MsgEmailExists T.Text
                | MsgResendVerifyEmail
                | MsgResetPwdEmailSent
                | MsgEmailVerified
                | MsgEmailUnverified
                | MsgCurrentPassword

-- | Defaults to 'englishAccountMsg'
defaultAccountMsg :: AccountMsg -> T.Text
defaultAccountMsg = englishAccountMsg

englishAccountMsg :: AccountMsg -> T.Text
englishAccountMsg MsgUsername = "Username"
englishAccountMsg MsgLoginName = "Username or email"
englishAccountMsg MsgForgotPassword = "Forgot password?"
englishAccountMsg MsgInvalidUsername = "Invalid username"
englishAccountMsg MsgInvalidPassword = "You must provide your current password"
englishAccountMsg MsgInvalidEmail' = "Invalid email"
englishAccountMsg (MsgUsernameExists u) =
    T.concat ["The username ", u, " already exists.  Please choose an alternate username."]
englishAccountMsg (MsgEmailExists u) =
    T.concat ["The email ", u, " already exists.  Please consider a password reset."]
englishAccountMsg MsgResendVerifyEmail = "Resend verification email"
englishAccountMsg MsgResetPwdEmailSent = "A password reset email has been sent to your email address."
englishAccountMsg MsgEmailVerified = "Your email has been verified."
englishAccountMsg MsgEmailUnverified = "Your email has not yet been verified."
englishAccountMsg MsgCurrentPassword = "Please fill in your current password"

russianAccountMsg :: AccountMsg -> T.Text
russianAccountMsg MsgUsername = "Имя пользователя"
russianAccountMsg MsgLoginName = "Имя или Эл.Почта"
russianAccountMsg MsgForgotPassword = "Забыли пароль?"
russianAccountMsg MsgInvalidUsername = "Неверное имя пользователя."
russianAccountMsg MsgInvalidPassword = "Вы должны ввести правильный пароль."
russianAccountMsg MsgInvalidEmail' = "Неправильный адрес эл.почты"
russianAccountMsg (MsgUsernameExists u) =
    T.concat ["Имя пользователя ", u, " уже занято. Пожалуйста, используйте другое имя."]
russianAccountMsg (MsgEmailExists u) =
    T.concat ["Электронный почтовый адрес ", u, " уже сущесвует.  Хотите сменить пароль?."]
russianAccountMsg MsgResendVerifyEmail = "Выслать заново письмо с подтверждением"
russianAccountMsg MsgResetPwdEmailSent = "Письмо для сброса пароля было выслано на ваш электронный адрес."
russianAccountMsg MsgEmailVerified = "Ваша эл.почта проверена."
russianAccountMsg MsgEmailUnverified = "Ваша эл.почта ещё не прошла проверку."
russianAccountMsg MsgCurrentPassword = "Пожалуйста введите Ваш текущий пароль"
