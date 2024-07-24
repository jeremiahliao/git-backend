const {exec} = require('child_process');

// gitfetch isolation config
const dotenv = require('dotenv');
dotenv.config();

// verify valid path from environment variable
// console.log(`GIT_PATH: ${process.env.GIT_PATH}`);

function runGitFetch(myResolve, myReject){
    try{
        exec(`./scripts/switchBranch.sh "${process.env.GIT_PATH}"`, (error, stdout, stderr) => {
            if (error) {
                console.error(`exec error: \n${error}`);
                return;
            }
            console.log(`stdout: \n${stdout}`);
            if (stderr != "")
                console.error(`stderr: \n${stderr}`);
        });
        myResolve("Git Fetch Completed");
    }
    catch(err){
        myReject(`Error: \n${err}`);
    }
}

const child = exec(`./scripts/switchBranch.sh "${process.env.GIT_PATH}" user1`, (error, stdout, stderr) => {
    if (error) {
        console.error(`exec error: \n${error}`);
        return;
    }
    console.log(`stdout: \n${stdout}`);
    if (stderr != "")
        console.error(`stderr: \n${stderr}`);
});

child.on('exit', (code) => {
    console.log(`Child process exited with code ${code}`);
});

// let gitfetch = new Promise(runGitFetch());
// gitfetch.then(
//     // verify that we are in github repository now
//     () => {
//         console.log("Fetch Completed: \nAccess repository files throught the below directory:");
//         exec("pwd", (error, stdout, stderr) => {
//             if (error) {
//                 console.error(`exec error: \n${error}`);
//                 return;
//             }
//             console.log(`stdout: \n${stdout}`);
//             if (stderr != "")
//                 console.error(`stderr: \n${stderr}`);
//         });
//     }
// )