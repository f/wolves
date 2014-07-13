describe 'channel listener', ->

  beforeEach => @listener = new ChannelListener
  afterEach => delete @listener

  it 'listens channel', =>
