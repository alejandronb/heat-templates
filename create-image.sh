#  Script para la creación de una imagen personalizada de Fedora con ansible, puppet...
git clone https://git.openstack.org/openstack/diskimage-builder.git
git clone https://git.openstack.org/openstack/tripleo-image-elements.git
git clone https://git.openstack.org/openstack/heat-templates.git
git clone https://git.openstack.org/openstack/dib-utils.git
export PATH="${PWD}/dib-utils/bin:$PATH"
export ELEMENTS_PATH=tripleo-image-elements/elements:heat-templates/hot/software-config/elements
diskimage-builder/bin/disk-image-create vm \
  fedora selinux-permissive \
  os-collect-config \
  os-refresh-config \
  os-apply-config \
  heat-config-ansible \
  heat-config-cfn-init \
  heat-config-docker-compose \
  heat-config-kubelet \
  heat-config-puppet \
  heat-config-salt \
  heat-config-script \
  -o fedora-software-config.qcow2

# glance image-create --disk-format qcow2 --container-format bare --name fedora-software-config < \
#   fedora-software-config.qcow2
