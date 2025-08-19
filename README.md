# Windows 11 Settings

Windows用に作成したPowerShellスクリプトを公開しています。

## 注意事項
- スクリプトの使用の際はすべて自己責任でお願いいたします。

---

## PowerShellの実行ポリシーについて
各スクリプトを実行するには、PowerShellの実行ポリシーを既定のものから変更する必要があります。
現在の実行ポリシーの確認方法は、
- PowerShellを管理者として実行する
- 以下のコマンドを実行する。
  <br><kbd>Get-ExecutionPolicy
スクリプトを実行できるように設定を変更するには、以下のコマンドを実行する。
  <br><kbd>Set-ExecutionPolicy RemoteSigned
これで、スクリプトを実行できるようになります。スクリプトを実行したら、実行ポリシーを元に戻しておくことをオススメします。
