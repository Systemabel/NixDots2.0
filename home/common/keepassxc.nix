{...}: {
  programs.keepassxc = {
    settings = {
      General.ConfigVersion = 2;
      Browser.CustomProxyLocation = "";
      FdoSecrets.Enabled = true;
      GUI = {
        ApplicationTheme = "dark";
        CompactMode = true;
        MizeOnClose = true;
        MinimizeOnStartup = true;
        MonospaceNotes = true;
        ShowTrayIcon = true;
        TrayIconAppearance = "monochrome-dark";
      };
      keeShare = {
        Active = ''<?xml version=\"1.0\"?><KeeShare><Active/></KeeShare>\n'';
        Own = ''<?xml version=\"1.0\"?><KeeShare><PrivateKey>MIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQC7e2yDtTT7B+mjWRtAvz09BkTWnDV4EL+6AZYGECTOFYd34SsHceSPUDHOT9ZzCMKoonV2kkFaOZU0KnvC8ZzEW67A1muHc12ugJVKZan3alSm9jHFWFQI/10ZboXvsKH1WsVyr4txMY1ewrE79/jKsF3hw/yFtbErtzMyOqmBpBiGT9T3KHdi2Y43Ri6j7cLWXbzJgA68YmE3SEsGm17tkWkncUavJKmw1UOlMBsLXvQiGLUkPPgnjz59OKEzdWnEfF+ic4UHYIXALSXgN6HITZezAw7pVHq7IDCDAPFlf+mcKIk4ZzbWSdzrYCbxDtYzoPHyvQneDVyAHhBvgvkhAgMBAAECgf8Caq57ao3ESDw6xTgUty8sgJtijzqHnnxzz8SfT2LDq7aTVQbsKz7gmg5ws/0pS0BqUnqXjLF+K3MNuRgShNeaFsep5+Z68htcpH7hw226Qr47AlfVGc5h6OjKUYjO2vgISzzZ8M/Bv2HGVu9YVo0rQueMgXo/2Je83ux9OURcgQgkRk6FpOWT7EPNSpHjw3PQSTB4jWl+NWV+lcLCf/9Oh8BneUGAZ8p92JPsF2uj2W2Bjh6JOVAf2J6SjRiK1CWxHm1J4OKFIN2+KUPm4Sq8+KEMZ42A+z4adYrZtg7NONZ+JoPgTviqWxj8ni/igGIoQLFFQlI1Kh7Lg4PsR0MCgYEAyHXjjtYY6EjzYcSzM6U60DiXoqGFDUc5j7ekHmFCk5Q6JLgUNisEiIq0d/GArXYBKmR1qlYFsUZQTn4YKmkAa0ydm6UKKgN1gDpoDctzkHdw8/llLUkODc4ByEnYds59EGwpCV/c0VXJu/tr/Yv6bgmQ5A/kECy38BCahgBwxAMCgYEA720DqzwlXtpPeBjivmi3cIOHz+5wsFxIqnlST/X3RvJaf9JBIfO724/dWc1WyDqeWNY8Ogjtp/uv5ssbKbkJMyzs0u167obFTZMpUT/WAGzusbcCouszTxPFhoKUcdaisUBrfccxX8Q1azSRV7tNLU4MMt7Zny6RUIvnlxo6LwsCgYBN8Vibjy98EfFgEGVFLXeiwn5jI75iHVGKSfMsRNDoJPg+krx5G1zV4mitQl+wEnP9kbYWlv/7n8VV371xsAYTsmSNwiwjjdjAFPWkd3jlsStgEZZ/dypZv8H9qIjcGQmTuxpxpK5tTpfz2Zxxp12mL14A7xTUHS8fzrTmaYFvFQKBgAUx6lh2z6DFP+AtOg5Dm2dXk0TRuaQ5/GGmjECr55ekfo4zc7JW5YaYEod2SyHBE9p9m4Tu2KlCbsilM4uuNiLkIKda+8XdKr7KKKVYqz4LHwrAG9CJJe3bUfffMXVe4NzTtwFdpxaa3UXcOCMdL0mCXgVkjHhFvGVxA69lpEmNAoGBAIuGUvOOyU0rxxdsP21Xx6KKdZaoD10Et4IT2DgjSWBY3F1xSj7BxOObqQ/wwKLaXO+TPwF8XbkXWPqsMss4RbhLOqF0r0FH/SS/+budfvNxQctjbJcAsXDiunyJ2TrE6a8x3xmOpzTSe7rbyMsuPT5xWIEJqCG0W/VUD/mhvh1A</PrivateKey><PublicKey><Signer>orca</Signer><Key>MIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQC7e2yDtTT7B+mjWRtAvz09BkTWnDV4EL+6AZYGECTOFYd34SsHceSPUDHOT9ZzCMKoonV2kkFaOZU0KnvC8ZzEW67A1muHc12ugJVKZan3alSm9jHFWFQI/10ZboXvsKH1WsVyr4txMY1ewrE79/jKsF3hw/yFtbErtzMyOqmBpBiGT9T3KHdi2Y43Ri6j7cLWXbzJgA68YmE3SEsGm17tkWkncUavJKmw1UOlMBsLXvQiGLUkPPgnjz59OKEzdWnEfF+ic4UHYIXALSXgN6HITZezAw7pVHq7IDCDAPFlf+mcKIk4ZzbWSdzrYCbxDtYzoPHyvQneDVyAHhBvgvkhAgMBAAECgf8Caq57ao3ESDw6xTgUty8sgJtijzqHnnxzz8SfT2LDq7aTVQbsKz7gmg5ws/0pS0BqUnqXjLF+K3MNuRgShNeaFsep5+Z68htcpH7hw226Qr47AlfVGc5h6OjKUYjO2vgISzzZ8M/Bv2HGVu9YVo0rQueMgXo/2Je83ux9OURcgQgkRk6FpOWT7EPNSpHjw3PQSTB4jWl+NWV+lcLCf/9Oh8BneUGAZ8p92JPsF2uj2W2Bjh6JOVAf2J6SjRiK1CWxHm1J4OKFIN2+KUPm4Sq8+KEMZ42A+z4adYrZtg7NONZ+JoPgTviqWxj8ni/igGIoQLFFQlI1Kh7Lg4PsR0MCgYEAyHXjjtYY6EjzYcSzM6U60DiXoqGFDUc5j7ekHmFCk5Q6JLgUNisEiIq0d/GArXYBKmR1qlYFsUZQTn4YKmkAa0ydm6UKKgN1gDpoDctzkHdw8/llLUkODc4ByEnYds59EGwpCV/c0VXJu/tr/Yv6bgmQ5A/kECy38BCahgBwxAMCgYEA720DqzwlXtpPeBjivmi3cIOHz+5wsFxIqnlST/X3RvJaf9JBIfO724/dWc1WyDqeWNY8Ogjtp/uv5ssbKbkJMyzs0u167obFTZMpUT/WAGzusbcCouszTxPFhoKUcdaisUBrfccxX8Q1azSRV7tNLU4MMt7Zny6RUIvnlxo6LwsCgYBN8Vibjy98EfFgEGVFLXeiwn5jI75iHVGKSfMsRNDoJPg+krx5G1zV4mitQl+wEnP9kbYWlv/7n8VV371xsAYTsmSNwiwjjdjAFPWkd3jlsStgEZZ/dypZv8H9qIjcGQmTuxpxpK5tTpfz2Zxxp12mL14A7xTUHS8fzrTmaYFvFQKBgAUx6lh2z6DFP+AtOg5Dm2dXk0TRuaQ5/GGmjECr55ekfo4zc7JW5YaYEod2SyHBE9p9m4Tu2KlCbsilM4uuNiLkIKda+8XdKr7KKKVYqz4LHwrAG9CJJe3bUfffMXVe4NzTtwFdpxaa3UXcOCMdL0mCXgVkjHhFvGVxA69lpEmNAoGBAIuGUvOOyU0rxxdsP21Xx6KKdZaoD10Et4IT2DgjSWBY3F1xSj7BxOObqQ/wwKLaXO+TPwF8XbkXWPqsMss4RbhLOqF0r0FH/SS/+budfvNxQctjbJcAsXDiunyJ2TrE6a8x3xmOpzTSe7rbyMsuPT5xWIEJqCG0W/VUD/mhvh1A</Key></PublicKey></KeeShare>\n'';
        QuietSuccess = true;
      };
      passwordGenerator = {
        AdditionalChars = "";
        ExcludedChars = "";
      };
      SSHAgent.Enabled = true;
      Security = {
        LockDatabaseIdle = true;
        LockDatabaseIdleSeconds = 300;
      };
    };
  };
}
