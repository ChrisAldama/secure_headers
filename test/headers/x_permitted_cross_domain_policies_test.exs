defmodule SecureHeaders.XPermittedCrossDomainPoliciesTest do
  use ExUnit.Case, async: true
  alias SecureHeaders.XPermittedCrossDomainPolicies

  test "should allow string value 'all'" do
    assert {:ok, _} = XPermittedCrossDomainPolicies.validate([config: [x_permitted_cross_domain_policies: "all"]])
  end

  test "should allow string value 'none'" do
    assert {:ok, _} = XPermittedCrossDomainPolicies.validate([config: [x_permitted_cross_domain_policies: "none"]])
  end

  test "should allow string value 'master-only'" do
    assert {:ok, _} = XPermittedCrossDomainPolicies.validate([config: [x_permitted_cross_domain_policies: "master-only"]])
  end

  test "should allow string value 'by-content-type'" do
    assert {:ok, _} = XPermittedCrossDomainPolicies.validate([config: [x_permitted_cross_domain_policies: "by-content-type"]])
  end

  test "should allow string value 'by-ftp-filename'" do
    assert {:ok, _} = XPermittedCrossDomainPolicies.validate([config: [x_permitted_cross_domain_policies: "BY-FTP-FILENAME"]])
  end

  test "validation fails if value is not 'all', 'none', 'master-only', 'by-content-type', or 'by-ftp-filename'" do
     assert {:error, "Invalid configuration for x-permitted-cross-domain-policies"} = XPermittedCrossDomainPolicies.validate([warn_only: true, config: [x_permitted_cross_domain_policies: "INVALID_CONFIG"]])
  end
end
