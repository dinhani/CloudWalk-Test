require 'spec_helper'

describe Quake::Infra::LogLineForNewGame do
  line = '0:00 InitGame: \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0\sv_maxRate\10000\sv_minRate\0\sv_hostname\Code Miner Server\g_gametype\0\sv_privateClients\2\sv_maxclients\16\sv_allowDownload\0\dmflags\0\fraglimit\20\timelimit\15\g_maxGameClients\0\capturelimit\8\version\ioq3 1.36 linux-x86_64 Apr 12 2009\protocol\68\mapname\q3dm17\gamename\baseq3\g_needpass\0'

  it 'matches the example' do
    expect(Quake::Infra::LogLineForNewGame.matches? line).to eq(true)
  end

  it 'parses correctly' do
    Quake::Infra::LogLineForNewGame.new(line)
  end
end
