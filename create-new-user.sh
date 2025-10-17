#To Run the script : Please pass default username of system like ubunut , enter new user name , password
#Example : ./create-new-user.sh ubuntu newusername password
DEFAULT_USER=$1
NEW_USER=$2
NEW_PASSWORD=$3

if [ -z "$DEFAULT_USER" ] || [ -z "$NEW_USER" ] || [ -z "$NEW_PASSWORD" ]; then
   echo "Please enter default username newusername newuser_password"
   exit 1
fi

#Add new user
sudo adduser --gecos "" --disabled-password $NEW_USER
echo "$NEW_USER:$NEW_PASSWORD" | sudo chpasswd

sudo mkdir -p /home/$NEW_USER/.ssh
sudo cp /home/$DEFAULT_USER/.ssh/authorized_keys /home/$NEW_USER/.ssh/authorized_keys
sudo chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh
sudo chmod 700 /home/$NEW_USER
sudo chmod 700 /home/$NEW_USER/.ssh
sudo chmod 600 /home/$NEW_USER/.ssh/authorized_keys

echo "User $NEW_USER created with password and ssh access from $DEFAULT_USER."
