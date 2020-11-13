# ansible-vault decrypt env.sh --vault-password-file /opt/vault.pass
. /opt/env.sh



lint_scripts () {
    echo "Running coffeelint"
    node_modules/coffeelint/bin/coffeelint -f coffeelint.json scripts/*.coffee
    if [ $? -ne 0 ]
    then
        echo "Coffeelint errors... Fix them first. Exiting!"
        exit 1
    fi
}
lint_scripts

PORT=8083 HUBOT_SLACK_TOKEN=xoxb-652930639268-1043266892753-PGZCv1ZfTgRxP9MA4GA7y5NE ./bin/hubot -a slack
# PORT=5000 ./bin/hubot
