const {spawn} = require('child_process');
require('dotenv').config();

const commandlineArgs = process.argv.slice(2);

function execute(command) {
    return new Promise((resolve, reject) => {
      const onExit = (error) => {
        if (error) {
          return reject(error);
        }
        resolve();
      };
      spawn(command.split(' ')[0], command.split(' ').slice(1), {
        stdio: 'inherit',
        shell: true,
      }).on('exit', onExit);
    });
  }

async function performAction(rawArgs){
  const action = rawArgs[0];
  const args = rawArgs.slice(1);
  if (action === 'deploy') {
    await execute(
      `forge create NFT --rpc-url=${process.env['RPC_URL']} --private-key=${process.env['PRIVATE_KEY']} --constructor-args ${args.join(' ')} --force`
    );
  }
  if (action === 'send') {
    await execute(
      `cast send --rpc-url=${process.env['RPC_URL']} --private-key=${process.env['PRIVATE_KEY']} ${args[0]} "${args[1]}" ${args.slice(2).join(' ')}`
    );
  }
}

performAction(commandlineArgs);
