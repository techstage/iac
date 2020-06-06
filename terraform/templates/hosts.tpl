[instances]
%{ for ip in instances ~}
${ip}
%{ endfor ~}