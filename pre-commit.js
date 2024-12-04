interface Props {
  tag: string;
  version: string; // Next version e.g. 1.12.3
}

export function preCommit(props: Props): void {
  console.log(props);
}
