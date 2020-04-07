const electron = require("electron");
const {app, BrowserWindow, ipcMain} = require('electron')
const path = require("path");
const isDev = require("electron-is-dev");
var spawn = require('child_process').spawn;
var child = require('child_process').execFile;
const { autoUpdater } = require("electron-updater")

let mainWindow;

function createWindow() {
mainWindow = new BrowserWindow({ width: 900, height: 680,webPreferences: {
    nodeIntegration: true},preload: path.join(__dirname, 'preload.js')
  });
mainWindow.loadURL(
isDev
? "http://localhost:3000"
: `file://${path.join(__dirname, "../build/index.html")}`
);
mainWindow.on("closed", () => (mainWindow = null));
}
app.on("ready", createWindow,()=>{
  autoUpdater.checkForUpdatesAndNotify();
});
app.on("window-all-closed", () => {
if (process.platform !== "darwin") {
app.quit();
}
});
app.on("activate", () => {
if (mainWindow === null) {
createWindow();
}
});

ipcMain.on('asynchronous-message', (event, arg) => {
    var executablePath = path.join(__dirname,'extraResources','SumatraPDF.exe');
    var expath2 = __dirname + `\\..\\extraResources\\SumatraPDF.exe`;
    var expath2 = expath2.replace('\\build', '');
    var expath3 = path.join(path.dirname(__dirname), 'extraResources','SumatraPDF.exe');
    var exeC = `D:\node-projects\mezoko-raports\dist\win-unpacked\resources\extraResources\SumatraPDF.exe`;
    //D:\node-projects\mezoko-raports\dist\win-unpacked\resources\app.asar\extraResources\SumatraPDF.exe
    // ma być D:\node-projects\mezoko-raports\dist\win-unpacked\resources\extraResources\SumatraPDF.exe
    //        D:\node-projects\mezoko-raports\dist\win-unpacked\resources\app.asar\build\..\extraResources\SumatraPDF.exe

    // console.log(executablePath);
    // var filePath = path.join(__dirname, 'app','src','labels',`96dc5d9a-747b-4353-949c-106a028c1223-204151918.pdf`);
    // console.log(filePath);
    // var parameters = ['-print-to',"HP Deskjet F735",'-silent',filePath];
    // console.log(parameters);
  // -print-to "HP Deskjet F735" -silent D:\\node-projects\\electron-quick-start\\app\\src\\labels\\96dc5d9a-747b-4353-949c-106a028c1223-204151918.pdf`
  //   child(executablePath, function(err, data) {
  //     console.log('exec child process')
  //     console.log(err)
  //     console.log(data.toString());
  // });

let bat = spawn("cmd.exe", [
  "/c",          // Argument for cmd.exe to carry out the specified script
  expath2,
  `-print-to`,
  "HP Deskjet F735",
  '-silent'
]);

child(expath2, function(err, data) {
    if(err){
       console.error(err);
       return;
    }
 
    console.log(data.toString());
});

    event.reply('asynchronous-reply', `${expath2}`)
  })
  