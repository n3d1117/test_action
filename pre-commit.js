const fs = require('fs');
const { execSync } = require('child_process');

exports.preCommit = (props) => {
  assert.ok(props.tag, 'tag should not be empty')

  const filePath = 'VERSION.swift';
  const fileContent = fs.readFileSync(filePath, 'utf8');
  const updatedContent = fileContent.replace(/(Version\(string: \")[^\"]*(\"\))/g, `$1${props.tag}$2`);
  fs.writeFileSync(filePath, updatedContent, 'utf8');

  execSync('git config user.name github-actions');
  execSync('git config user.email github-actions@github.com');

  execSync('git add VERSION.swift');
  execSync(`git commit -m "chore: update version to ${props.tag}"`);
  execSync('git push');
}
