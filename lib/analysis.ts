import atom = require('atom');
import path = require('path');

export class AnalysisServer {
  private process;
  private sdkPath: string;

  constructor(sdkPath: string) {
    this.sdkPath = sdkPath;
  }

  start(): void {
    console.log('Start Dart Analysis Server');
  }

  stop() {
  }

  pause() {
  }

  private startServer(): void {
    var serverCommand = path.join(this.sdkPath + '/bin/dart');
    console.log(serverCommand);
  }
}

module.exports.AnalysisServer = AnalysisServer;
