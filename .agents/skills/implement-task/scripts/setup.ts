import git from "git";
import stdlib from "stdlib";

export default async function ({ branchName }: { branchName: string }) {
  await git.worktree.add({ path: "../workstrees", branch: branchName });
  await stdlib.cd(`../worktrees/${branchName}`);
}
