describe Quake::Infra::LogParser do
  lines = [
    "aaa",
    '0:00 InitGame: \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0\sv_maxRate\10000\sv_minRate\0\sv_hostname\Code Miner Server\g_gametype\0\sv_privateClients\2\sv_maxclients\16\sv_allowDownload\0\dmflags\0\fraglimit\20\timelimit\15\g_maxGameClients\0\capturelimit\8\version\ioq3 1.36 linux-x86_64 Apr 12 2009\protocol\68\mapname\q3dm17\gamename\baseq3\g_needpass\0',
    "bbb",
    "ccc",
    '20:34 ClientUserinfoChanged: 2 n\Isgalamido\t\0\model\xian/default\hmodel\xian/default\g_redteam\\g_blueteam\\c1\4\c2\5\hc\100\w\0\l\0\tt\0\tl\0',
    "ddd",
    "20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT",
    "eee",
    '0:00 InitGame: \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0\sv_maxRate\10000\sv_minRate\0\sv_hostname\Code Miner Server\g_gametype\0\sv_privateClients\2\sv_maxclients\16\sv_allowDownload\0\dmflags\0\fraglimit\20\timelimit\15\g_maxGameClients\0\capturelimit\8\version\ioq3 1.36 linux-x86_64 Apr 12 2009\protocol\68\mapname\q3dm17\gamename\baseq3\g_needpass\0',
  ]
  parser = Quake::Infra::LogParser.new

  it "parses the matches correctly" do
    matches = parser.parse_matches(lines)
    expect(matches.size).to eq(2)

    matches = parser.parse_matches(lines)
    expect(matches[0].players.size).to eq(1)
    expect(matches[0].kills.size).to eq(1)
  end
end
