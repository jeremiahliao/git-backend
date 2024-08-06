const util = require('node:util');
const exec = util.promisify(require('node:child_process').exec);

// DEBUG
// dotenv config
// const dotenv = require('dotenv');
// dotenv.config();

// verify valid path from environment variable
// console.log(`GIT_PATH: ${process.env.GIT_PATH}`);


async function switchBranch(user, webpath){
    try {
        const {stdout, stderr} = await exec(`./scripts/fetchRepo.sh "${process.env.GIT_PATH}" ${user} "${process.env.WEB_PATH}" ${webpath}`);
        console.log(`stdout: \n${stdout}`);
        if (stderr != "")
            console.error(`stderr: \n${stderr}`);
    }
    catch (error) {
        throw new Error(`exec error: \n${error}`);
    }
}

async function resetBranch(user, webpath){
    try {
        const {stdout, stderr} = await exec(`./scripts/resetRepo.sh "${process.env.WEB_PATH}" ${webpath} ${user}`);
        console.log(`stdout: \n${stdout}`);
        if (stderr != "")
            console.error(`stderr: \n${stderr}`);
    }
    catch (error) {
        throw new Error(`exec error: \n${error}`);
    }
}

module.exports = {
    switchBranch,
    resetBranch
}