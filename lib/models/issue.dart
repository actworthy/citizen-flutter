/// Describes something that an [Action] attempts to improve. An [Action]
/// is created with the purpose of combatting a particular (or multiple
/// particular) [Issue]s. If an action is to volunteer at the local
/// homeless shelter, then the [Issue] associated with that [Action] would
/// likely be "homelessness" in the user's community.
class Issue {
  final String name;

  Issue(this.name);
}
