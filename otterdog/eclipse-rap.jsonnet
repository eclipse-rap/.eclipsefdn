local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('rt.rap', 'eclipse-rap') {
  settings+: {
    description: "",
    name: "Eclipse RAP",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/rap/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse RAP (Remote Application Platform) general information",
      homepage: "https://www.eclipse.org/rap/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('org.eclipse.rap') {
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse RAP Runtime (Remote Application Platform)",
      has_discussions: true,
      homepage: "https://www.eclipse.org/rap/",
      topics+: [
        "eclipse",
        "java",
        "javascript",
        "rcp",
        "swt"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          bypass_pull_request_allowances+: [
            "@eclipse-rap/rt-rap-project-leads"
          ],
          required_approving_review_count: 1,
          requires_linear_history: true,
          requires_status_checks: false,
          requires_strict_status_checks: true,
          restricts_review_dismissals: true,
          review_dismissal_allowances+: [
            "@eclipse-rap/rt-rap-project-leads"
          ],
        },
      ],
    },
    orgs.newRepo('org.eclipse.rap.tools') {
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse RAP Tools (Remote Application Platform)",
      homepage: "https://www.eclipse.org/rap/",
      topics+: [
        "eclipse",
        "java"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          bypass_pull_request_allowances+: [
            "@eclipse-rap/rt-rap-project-leads"
          ],
          required_approving_review_count: 1,
          requires_linear_history: true,
          requires_status_checks: false,
          requires_strict_status_checks: true,
          restricts_review_dismissals: true,
          review_dismissal_allowances+: [
            "@eclipse-rap/rt-rap-project-leads"
          ],
        },
      ],
    },
    orgs.newRepo('org.eclipse.rap.website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
}
