# helpers
def redhat?
  os[:family] == 'redhat'
end

def release?(test_version)
  os[:release] == test_version
end

def debian?
  %w(debian).include?(os[:family])
end

def debian9?
  %w(debian).include?(os[:family]) && os[:release].to_f >= 9.0
end

def ubuntu?
  %w(ubuntu).include?(os[:family])
end

def firewalld?
  redhat? && os[:release].to_f >= 7.0
end

def rhel_iptables?
  (redhat? && os[:release].to_f < 7.0)
end

def windows?
  %w(windows).include?(os[:family])
end

def iptables_persistent?
  %w(debian).include?(os[:family]) && os[:release].to_f <= (ubuntu? ? 14.04 : 7)
end

def netfilter_persistent?
  %w(debian).include?(os[:family]) && os[:release].to_f > (ubuntu? ? 14.04 : 7)
end
